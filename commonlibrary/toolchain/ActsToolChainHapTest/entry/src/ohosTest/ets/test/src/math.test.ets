/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import * as testNapi from "libentry.so";
import { describe, expect, it, Level } from "@ohos/hypium";

export default function math_group_test() {
  describe("ActsToolChainHapTest_src_math", () => {
    /**
     * @tc.name   acos
     * @tc.number SUB_THIRDPARTY_MUSL_ACOS_0100
     * @tc.desc   libc-test acos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acos", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acos");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   acosh
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSH_0100
     * @tc.desc   libc-test acosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acosh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acosh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   acoshf
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSHF_0100
     * @tc.desc   libc-test acoshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acoshf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acoshf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   acosl
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSL_0100
     * @tc.desc   libc-test acosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acosl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acosl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asin
     * @tc.number SUB_THIRDPARTY_MUSL_ASIN_0100
     * @tc.desc   libc-test asin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asin", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asin");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinf
     * @tc.number SUB_THIRDPARTY_MUSL_ASINF_0100
     * @tc.desc   libc-test asinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinh
     * @tc.number SUB_THIRDPARTY_MUSL_ASINH_0100
     * @tc.desc   libc-test asinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinhf
     * @tc.number SUB_THIRDPARTY_MUSL_ASINHF_0100
     * @tc.desc   libc-test asinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinhf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinhf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinl
     * @tc.number SUB_THIRDPARTY_MUSL_ASINL_0100
     * @tc.desc   libc-test asinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_0100
     * @tc.desc   libc-test atan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan2
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_TWO_0100
     * @tc.desc   libc-test atan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan2");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan2f
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_TWO_F_0100
     * @tc.desc   libc-test atan2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan2f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan2f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan2l
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_TWO_L_0100
     * @tc.desc   libc-test atan2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan2l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan2l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanf
     * @tc.number SUB_THIRDPARTY_MUSL_ATANF_0100
     * @tc.desc   libc-test atanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanh
     * @tc.number SUB_THIRDPARTY_MUSL_ATANH_0100
     * @tc.desc   libc-test atanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanhf
     * @tc.number SUB_THIRDPARTY_MUSL_ATANHF_0100
     * @tc.desc   libc-test atanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanhf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanhf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanhl
     * @tc.number SUB_THIRDPARTY_MUSL_ATANHL_0100
     * @tc.desc   libc-test atanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanhl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanhl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanl
     * @tc.number SUB_THIRDPARTY_MUSL_ATANL_0100
     * @tc.desc   libc-test atanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cbrt
     * @tc.number SUB_THIRDPARTY_MUSL_CBRT_0100
     * @tc.desc   libc-test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cbrt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cbrt");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cbrtf
     * @tc.number SUB_THIRDPARTY_MUSL_CBRTF_0100
     * @tc.desc   libc-test cbrtf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cbrtf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cbrtf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cbrtl
     * @tc.number SUB_THIRDPARTY_MUSL_CBRTL_0100
     * @tc.desc   libc-test cbrtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cbrtl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cbrtl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ceil
     * @tc.number SUB_THIRDPARTY_MUSL_CEIL_0100
     * @tc.desc   libc-test ceil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ceil", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ceil");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ceilf
     * @tc.number SUB_THIRDPARTY_MUSL_CEILF_0100
     * @tc.desc   libc-test ceilf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ceilf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ceilf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ceill
     * @tc.number SUB_THIRDPARTY_MUSL_CEILL_0100
     * @tc.desc   libc-test ceill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ceill", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ceill");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   copysign
     * @tc.number SUB_THIRDPARTY_MUSL_COPYSIGN_0100
     * @tc.desc   libc-test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("copysign", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("copysign");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   copysignf
     * @tc.number SUB_THIRDPARTY_MUSL_COPYSIGNF_0100
     * @tc.desc   libc-test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("copysignf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("copysignf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   copysignl
     * @tc.number SUB_THIRDPARTY_MUSL_COPYSIGNL_0100
     * @tc.desc   libc-test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("copysignl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("copysignl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cos
     * @tc.number SUB_THIRDPARTY_MUSL_COS_0100
     * @tc.desc   libc-test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cos", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cos");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cosf
     * @tc.number SUB_THIRDPARTY_MUSL_COSF_0100
     * @tc.desc   libc-test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cosf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cosf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cosh
     * @tc.number SUB_THIRDPARTY_MUSL_COSH_0100
     * @tc.desc   libc-test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cosh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cosh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   coshf
     * @tc.number SUB_THIRDPARTY_MUSL_COSHF_0100
     * @tc.desc   libc-test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("coshf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("coshf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   coshl
     * @tc.number SUB_THIRDPARTY_MUSL_COSHL_0100
     * @tc.desc   libc-test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("coshl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("coshl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cosl
     * @tc.number SUB_THIRDPARTY_MUSL_COSL_0100
     * @tc.desc   libc-test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cosl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cosl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   drem
     * @tc.number SUB_THIRDPARTY_MUSL_DREM_0100
     * @tc.desc   libc-test drem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("drem", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("drem");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dremf
     * @tc.number SUB_THIRDPARTY_MUSL_DREMF_0100
     * @tc.desc   libc-test dremf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dremf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dremf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erf
     * @tc.number SUB_THIRDPARTY_MUSL_ERF_0100
     * @tc.desc   libc-test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erfc
     * @tc.number SUB_THIRDPARTY_MUSL_ERFC_0100
     * @tc.desc   libc-test erfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erfc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erfc");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erfcf
     * @tc.number SUB_THIRDPARTY_MUSL_ERFCF_0100
     * @tc.desc   libc-test erfcf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erfcf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erfcf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erff
     * @tc.number SUB_THIRDPARTY_MUSL_ERFF_0100
     * @tc.desc   libc-test erff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erff", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erff");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erfl
     * @tc.number SUB_THIRDPARTY_MUSL_ERFL_0100
     * @tc.desc   libc-test erfl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erfl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erfl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_0100
     * @tc.desc   libc-test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp2
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TWO_0100
     * @tc.desc   libc-test exp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp2");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp2f
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TWO_F_0100
     * @tc.desc   libc-test exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp2f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp2f");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp2l
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TWO_L_0100
     * @tc.desc   libc-test exp2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp2l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp2l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expf
     * @tc.number SUB_THIRDPARTY_MUSL_EXPF_0100
     * @tc.desc   libc-test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expl
     * @tc.number SUB_THIRDPARTY_MUSL_EXPL_0100
     * @tc.desc   libc-test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expm1
     * @tc.number SUB_THIRDPARTY_MUSL_EXPM_ONE_0100
     * @tc.desc   libc-test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expm1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expm1");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expm1f
     * @tc.number SUB_THIRDPARTY_MUSL_EXPM_ONE_F_0100
     * @tc.desc   libc-test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expm1f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expm1f");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expm1l
     * @tc.number SUB_THIRDPARTY_MUSL_EXPM_ONE_L_0100
     * @tc.desc   libc-test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expm1l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expm1l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fabs
     * @tc.number SUB_THIRDPARTY_MUSL_FABS_0100
     * @tc.desc   libc-test fabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fabs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fabs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fabsf
     * @tc.number SUB_THIRDPARTY_MUSL_FABSF_0100
     * @tc.desc   libc-test fabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fabsf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fabsf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fabsl
     * @tc.number SUB_THIRDPARTY_MUSL_FABSL_0100
     * @tc.desc   libc-test fabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fabsl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fabsl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fdiml
     * @tc.number SUB_THIRDPARTY_MUSL_FDIML_0100
     * @tc.desc   libc-test fdiml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fdiml", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fdiml");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   floor
     * @tc.number SUB_THIRDPARTY_MUSL_FLOOR_0100
     * @tc.desc   libc-test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("floor", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("floor");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   floorf
     * @tc.number SUB_THIRDPARTY_MUSL_FLOORF_0100
     * @tc.desc   libc-test floorf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("floorf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("floorf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   floorl
     * @tc.number SUB_THIRDPARTY_MUSL_FLOORL_0100
     * @tc.desc   libc-test floorl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("floorl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("floorl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fmax
     * @tc.number SUB_THIRDPARTY_MUSL_FMAX_0100
     * @tc.desc   libc-test fmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmax", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmax");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fmaxf
     * @tc.number SUB_THIRDPARTY_MUSL_FMAXF_0100
     * @tc.desc   libc-test fmaxf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmaxf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmaxf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fmaxl
     * @tc.number SUB_THIRDPARTY_MUSL_FMAXL_0100
     * @tc.desc   libc-test fmaxl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmaxl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmaxl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   frexp
     * @tc.number SUB_THIRDPARTY_MUSL_FREXP_0100
     * @tc.desc   libc-test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("frexp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("frexp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   frexpf
     * @tc.number SUB_THIRDPARTY_MUSL_FREXPF_0100
     * @tc.desc   libc-test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("frexpf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("frexpf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   frexpl
     * @tc.number SUB_THIRDPARTY_MUSL_FREXPL_0100
     * @tc.desc   libc-test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("frexpl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("frexpl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hypot
     * @tc.number SUB_THIRDPARTY_MUSL_HYPOT_0100
     * @tc.desc   libc-test hypot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hypot", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hypot");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hypotf
     * @tc.number SUB_THIRDPARTY_MUSL_HYPOTF_0100
     * @tc.desc   libc-test hypotf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hypotf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hypotf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hypotl
     * @tc.number SUB_THIRDPARTY_MUSL_HYPOTL_0100
     * @tc.desc   libc-test hypotl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hypotl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hypotl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ilogb
     * @tc.number SUB_THIRDPARTY_MUSL_ILOGB_0100
     * @tc.desc   libc-test ilogb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ilogb", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ilogb");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ilogbf
     * @tc.number SUB_THIRDPARTY_MUSL_ILOGBF_0100
     * @tc.desc   libc-test ilogbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ilogbf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ilogbf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ilogbl
     * @tc.number SUB_THIRDPARTY_MUSL_ILOGBL_0100
     * @tc.desc   libc-test ilogbl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ilogbl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ilogbl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   acosf
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_0100
     * @tc.desc   libc-test acosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acosf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acosf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   exp10
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TEN_0100
     * @tc.desc   libc-test exp10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp10", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp10");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   exp10f
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TEN_F_0100
     * @tc.desc   libc-test exp10f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp10f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp10f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   exp10l
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TEN_L_0100
     * @tc.desc   libc-test exp10l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp10l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp10l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fdim
     * @tc.number SUB_THIRDPARTY_MUSL_FDIM_0100
     * @tc.desc   libc-test fdim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fdim", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fdim");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fdimf
     * @tc.number SUB_THIRDPARTY_MUSL_FDIMF_0100
     * @tc.desc   libc-test fdimf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fdimf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fdimf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fmin
     * @tc.number SUB_THIRDPARTY_MUSL_FMIN_0100
     * @tc.desc   libc-test fmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmin", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmin");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fminf
     * @tc.number SUB_THIRDPARTY_MUSL_FMINF_0100
     * @tc.desc   libc-test fminf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fminf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fminf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fminl
     * @tc.number SUB_THIRDPARTY_MUSL_FMINL_0100
     * @tc.desc   libc-test fminl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fminl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fminl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fmod
     * @tc.number SUB_THIRDPARTY_MUSL_FMOD_0100
     * @tc.desc   libc-test fmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmod", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmod");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fmodf
     * @tc.number SUB_THIRDPARTY_MUSL_FMODF_0100
     * @tc.desc   libc-test fmodf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmodf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmodf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fmodl
     * @tc.number SUB_THIRDPARTY_MUSL_FMODL_0100
     * @tc.desc   libc-test fmodl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmodl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmodl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   j0
     * @tc.number SUB_THIRDPARTY_MUSL_J_ZERO_0100
     * @tc.desc   libc-test j0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("j0", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("j0");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   j0f
     * @tc.number SUB_THIRDPARTY_MUSL_J_ZERO_F_0100
     * @tc.desc   libc-test j0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("j0f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("j0f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   j1
     * @tc.number SUB_THIRDPARTY_MUSL_J_ONE_0100
     * @tc.desc   libc-test j1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("j1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("j1");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   jn
     * @tc.number SUB_THIRDPARTY_MUSL_JN_0100
     * @tc.desc   libc-test jn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("jn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("jn");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   jnf
     * @tc.number SUB_THIRDPARTY_MUSL_JNF_0100
     * @tc.desc   libc-test jnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("jnf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("jnf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ldexp
     * @tc.number SUB_THIRDPARTY_MUSL_LDEXP_0100
     * @tc.desc   libc-test ldexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ldexp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ldexp");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ldexpf
     * @tc.number SUB_THIRDPARTY_MUSL_LDEXPF_0100
     * @tc.desc   libc-test ldexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ldexpf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ldexpf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ldexpl
     * @tc.number SUB_THIRDPARTY_MUSL_LDEXPL_0100
     * @tc.desc   libc-test ldexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ldexpl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ldexpl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lgamma
     * @tc.number SUB_THIRDPARTY_MUSL_LGAMMA_0100
     * @tc.desc   libc-test lgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lgamma", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lgamma");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lgamma_r
     * @tc.number SUB_THIRDPARTY_MUSL_LGAMMA_R_0100
     * @tc.desc   libc-test lgamma_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lgamma_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lgamma_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lgammaf
     * @tc.number SUB_THIRDPARTY_MUSL_LGAMMAF_0100
     * @tc.desc   libc-test lgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lgammaf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lgammaf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lgammaf_r
     * @tc.number SUB_THIRDPARTY_MUSL_LGAMMAF_R_0100
     * @tc.desc   libc-test lgammaf_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lgammaf_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lgammaf_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lgammal_r
     * @tc.number SUB_THIRDPARTY_MUSL_LGAMMAL_R_0100
     * @tc.desc   libc-test lgammal_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lgammal_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lgammal_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   llrint
     * @tc.number SUB_THIRDPARTY_MUSL_LLRINT_0100
     * @tc.desc   libc-test llrint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("llrint", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("llrint");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   llrintf
     * @tc.number SUB_THIRDPARTY_MUSL_LLRINTF_0100
     * @tc.desc   libc-test llrintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("llrintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("llrintf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   llrintl
     * @tc.number SUB_THIRDPARTY_MUSL_LLRINTL_0100
     * @tc.desc   libc-test llrintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("llrintl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("llrintl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   llround
     * @tc.number SUB_THIRDPARTY_MUSL_LLROUND_0100
     * @tc.desc   libc-test llround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("llround", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("llround");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   llroundf
     * @tc.number SUB_THIRDPARTY_MUSL_LLROUNDF_0100
     * @tc.desc   libc-test llroundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("llroundf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("llroundf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   llroundl
     * @tc.number SUB_THIRDPARTY_MUSL_LLROUNDL_0100
     * @tc.desc   libc-test llroundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("llroundl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("llroundl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_0100
     * @tc.desc   libc-test log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log10
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_TEN_0100
     * @tc.desc   libc-test log10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log10", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log10");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log10f
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_TEN_F_0100
     * @tc.desc   libc-test log10f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log10f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log10f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log10l
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_TEN_L_0100
     * @tc.desc   libc-test log10l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log10l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log10l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log1p
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_ONE_P_0100
     * @tc.desc   libc-test log1p
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log1p", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log1p");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log1pf
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_ONE_P_F_0100
     * @tc.desc   libc-test log1pf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log1pf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log1pf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log1pl
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_ONE_PL_0100
     * @tc.desc   libc-test log1pl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log1pl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log1pl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log2
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_TWO_0100
     * @tc.desc   libc-test log2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log2");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log2f
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_TWO_F_0100
     * @tc.desc   libc-test log2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log2f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log2f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   log2l
     * @tc.number SUB_THIRDPARTY_MUSL_LOG_TWO_L_0100
     * @tc.desc   libc-test log2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("log2l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("log2l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   logb
     * @tc.number SUB_THIRDPARTY_MUSL_LOGB_0100
     * @tc.desc   libc-test logb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("logb", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("logb");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   logbf
     * @tc.number SUB_THIRDPARTY_MUSL_LOGBF_0100
     * @tc.desc   libc-test logbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("logbf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("logbf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   logbl
     * @tc.number SUB_THIRDPARTY_MUSL_LOGBL_0100
     * @tc.desc   libc-test logbl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("logbl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("logbl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   logf
     * @tc.number SUB_THIRDPARTY_MUSL_LOGF_0100
     * @tc.desc   libc-test logf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("logf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("logf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   logl
     * @tc.number SUB_THIRDPARTY_MUSL_LOGL_0100
     * @tc.desc   libc-test logl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("logl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("logl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lrint
     * @tc.number SUB_THIRDPARTY_MUSL_LRINT_0100
     * @tc.desc   libc-test lrint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lrint", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lrint");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lrintf
     * @tc.number SUB_THIRDPARTY_MUSL_LRINTF_0100
     * @tc.desc   libc-test lrintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lrintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lrintf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lrintl
     * @tc.number SUB_THIRDPARTY_MUSL_LRINTL_0100
     * @tc.desc   libc-test lrintl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lrintl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lrintl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lround
     * @tc.number SUB_THIRDPARTY_MUSL_LROUND_0100
     * @tc.desc   libc-test lround
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lround", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lround");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lroundf
     * @tc.number SUB_THIRDPARTY_MUSL_LROUNDF_0100
     * @tc.desc   libc-test lroundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lroundf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lroundf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lroundl
     * @tc.number SUB_THIRDPARTY_MUSL_LROUNDL_0100
     * @tc.desc   libc-test lroundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lroundl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lroundl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   modf
     * @tc.number SUB_THIRDPARTY_MUSL_MODF_0100
     * @tc.desc   libc-test modf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("modf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("modf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   modff
     * @tc.number SUB_THIRDPARTY_MUSL_MODFF_0100
     * @tc.desc   libc-test modff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("modff", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("modff");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   modfl
     * @tc.number SUB_THIRDPARTY_MUSL_MODFL_0100
     * @tc.desc   libc-test modfl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("modfl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("modfl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   nextafter
     * @tc.number SUB_THIRDPARTY_MUSL_NEXTAFTER_0100
     * @tc.desc   libc-test nextafter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nextafter", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nextafter");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   nextafterf
     * @tc.number SUB_THIRDPARTY_MUSL_NEXTAFTERF_0100
     * @tc.desc   libc-test nextafterf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nextafterf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nextafterf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   nextafterl
     * @tc.number SUB_THIRDPARTY_MUSL_NEXTAFTERL_0100
     * @tc.desc   libc-test nextafterl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nextafterl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nextafterl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pow
     * @tc.number SUB_THIRDPARTY_MUSL_POW_0100
     * @tc.desc   libc-test pow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pow", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pow");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pow10
     * @tc.number SUB_THIRDPARTY_MUSL_POW_TEN_0100
     * @tc.desc   libc-test pow10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pow10", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pow10");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pow10f
     * @tc.number SUB_THIRDPARTY_MUSL_POW_TEN_F_0100
     * @tc.desc   libc-test pow10f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pow10f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pow10f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pow10l
     * @tc.number SUB_THIRDPARTY_MUSL_POW_TEN_L_0100
     * @tc.desc   libc-test pow10l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pow10l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pow10l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   powf
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_0100
     * @tc.desc   libc-test powf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("powf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("powf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   powl
     * @tc.number SUB_THIRDPARTY_MUSL_POWL_0100
     * @tc.desc   libc-test powl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("powl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("powl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   remainder
     * @tc.number SUB_THIRDPARTY_MUSL_REMAINDER_0100
     * @tc.desc   libc-test remainder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remainder", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remainder");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   remainderf
     * @tc.number SUB_THIRDPARTY_MUSL_REMAINDERF_0100
     * @tc.desc   libc-test remainderf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remainderf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remainderf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   remainderl
     * @tc.number SUB_THIRDPARTY_MUSL_REMAINDERL_0100
     * @tc.desc   libc-test remainderl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remainderl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remainderl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   remquo
     * @tc.number SUB_THIRDPARTY_MUSL_REMQUO_0100
     * @tc.desc   libc-test remquo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remquo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remquo");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   remquof
     * @tc.number SUB_THIRDPARTY_MUSL_REMQUOF_0100
     * @tc.desc   libc-test remquof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remquof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remquof");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   remquol
     * @tc.number SUB_THIRDPARTY_MUSL_REMQUOL_0100
     * @tc.desc   libc-test remquol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remquol", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remquol");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   round
     * @tc.number SUB_THIRDPARTY_MUSL_ROUND_0100
     * @tc.desc   libc-test round
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("round", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("round");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   roundf
     * @tc.number SUB_THIRDPARTY_MUSL_ROUNDF_0100
     * @tc.desc   libc-test roundf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("roundf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("roundf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   roundl
     * @tc.number SUB_THIRDPARTY_MUSL_ROUNDL_0100
     * @tc.desc   libc-test roundl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("roundl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("roundl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalb
     * @tc.number SUB_THIRDPARTY_MUSL_SCALB_0100
     * @tc.desc   libc-test scalb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalb", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalb");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalbf
     * @tc.number SUB_THIRDPARTY_MUSL_SCALBF_0100
     * @tc.desc   libc-test scalbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalbf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalbf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalbln
     * @tc.number SUB_THIRDPARTY_MUSL_SCALBLN_0100
     * @tc.desc   libc-test scalbln
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalbln", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalbln");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalblnf
     * @tc.number SUB_THIRDPARTY_MUSL_SCALBLNF_0100
     * @tc.desc   libc-test scalblnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalblnf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalblnf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalblnl
     * @tc.number SUB_THIRDPARTY_MUSL_SCALBLNL_0100
     * @tc.desc   libc-test scalblnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalblnl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalblnl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalbn
     * @tc.number SUB_THIRDPARTY_MUSL_SCALBN_0100
     * @tc.desc   libc-test scalbn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalbn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalbn");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalbnf
     * @tc.number SUB_THIRDPARTY_MUSL_SCALBNF_0100
     * @tc.desc   libc-test scalbnf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalbnf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalbnf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scalbnl
     * @tc.number SUB_THIRDPARTY_MUSL_SCALBNL_0100
     * @tc.desc   libc-test scalbnl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scalbnl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scalbnl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sin
     * @tc.number SUB_THIRDPARTY_MUSL_SIN_0100
     * @tc.desc   libc-test sin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sin", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sin");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sincos
     * @tc.number SUB_THIRDPARTY_MUSL_SINCOS_0100
     * @tc.desc   libc-test sincos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sincos", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sincos");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sincosf
     * @tc.number SUB_THIRDPARTY_MUSL_SINCOSF_0100
     * @tc.desc   libc-test sincosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sincosf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sincosf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sincosl
     * @tc.number SUB_THIRDPARTY_MUSL_SINCOSL_0100
     * @tc.desc   libc-test sincosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sincosl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sincosl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sinf
     * @tc.number SUB_THIRDPARTY_MUSL_SINF_0100
     * @tc.desc   libc-test sinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sinf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sinf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sinh
     * @tc.number SUB_THIRDPARTY_MUSL_SINH_0100
     * @tc.desc   libc-test sinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sinh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sinh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sinhf
     * @tc.number SUB_THIRDPARTY_MUSL_SINHF_0100
     * @tc.desc   libc-test sinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sinhf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sinhf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sinhl
     * @tc.number SUB_THIRDPARTY_MUSL_SINHL_0100
     * @tc.desc   libc-test sinhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sinhl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sinhl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sinl
     * @tc.number SUB_THIRDPARTY_MUSL_SINL_0100
     * @tc.desc   libc-test sinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sinl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sinl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tan
     * @tc.number SUB_THIRDPARTY_MUSL_TAN_0100
     * @tc.desc   libc-test tan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tan", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tan");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tanf
     * @tc.number SUB_THIRDPARTY_MUSL_TANF_0100
     * @tc.desc   libc-test tanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tanf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tanh
     * @tc.number SUB_THIRDPARTY_MUSL_TANH_0100
     * @tc.desc   libc-test tanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tanh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tanh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tanhf
     * @tc.number SUB_THIRDPARTY_MUSL_TANHF_0100
     * @tc.desc   libc-test tanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tanhf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tanhf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tanhl
     * @tc.number SUB_THIRDPARTY_MUSL_TANHL_0100
     * @tc.desc   libc-test tanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tanhl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tanhl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tanl
     * @tc.number SUB_THIRDPARTY_MUSL_TANL_0100
     * @tc.desc   libc-test tanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tanl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tanl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   trunc
     * @tc.number SUB_THIRDPARTY_MUSL_TRUNC_0100
     * @tc.desc   libc-test trunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("trunc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("trunc");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   truncf
     * @tc.number SUB_THIRDPARTY_MUSL_TRUNCF_0100
     * @tc.desc   libc-test truncf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("truncf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("truncf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   truncl
     * @tc.number SUB_THIRDPARTY_MUSL_TRUNCL_0100
     * @tc.desc   libc-test truncl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("truncl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("truncl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tgamma
     * @tc.number SUB_THIRDPARTY_MUSL_TGAMMA_0100
     * @tc.desc   libc-test tgamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tgamma", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tgamma");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tgammaf
     * @tc.number SUB_THIRDPARTY_MUSL_TGAMMAF_0100
     * @tc.desc   libc-test tgammaf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tgammaf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tgammaf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   y0
     * @tc.number SUB_THIRDPARTY_MUSL_Y_ZERO_0100
     * @tc.desc   libc-test y0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("y0", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("y0");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   y0f
     * @tc.number SUB_THIRDPARTY_MUSL_Y_ZERO_F_0100
     * @tc.desc   libc-test y0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("y0f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("y0f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   y1
     * @tc.number SUB_THIRDPARTY_MUSL_Y_ONE_0100
     * @tc.desc   libc-test y1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("y1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("y1");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   y1f
     * @tc.number SUB_THIRDPARTY_MUSL_Y_ONE_F_0100
     * @tc.desc   libc-test y1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("y1f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("y1f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   yn
     * @tc.number SUB_THIRDPARTY_MUSL_YN_0100
     * @tc.desc   libc-test yn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("yn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("yn");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ynf
     * @tc.number SUB_THIRDPARTY_MUSL_YNF_0100
     * @tc.desc   libc-test ynf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ynf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ynf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   isless
     * @tc.number SUB_THIRDPARTY_MUSL_ISLESS_0100
     * @tc.desc   libc-test isless
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isless", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isless");
      expect(result).assertEqual(0);
      done();
    });
  });
}
