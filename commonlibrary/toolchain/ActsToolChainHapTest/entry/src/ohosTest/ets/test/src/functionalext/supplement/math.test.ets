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
  describe("ActsToolChainHapTest_src_functionalext_supplement_math", () => {
    /**
     * @tc.name   fpclassifyf
     * @tc.number SUB_THIRDPARTY_MUSL_FPCLASSIFYF_0100
     * @tc.desc   libc-test __fpclassifyf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fpclassifyf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fpclassifyf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fpclassifyl
     * @tc.number SUB_THIRDPARTY_MUSL_FPCLASSIFYL_0100
     * @tc.desc   libc-test __fpclassifyl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fpclassifyl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fpclassifyl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   signbitf
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNBITF_0100
     * @tc.desc   libc-test __signbitf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("signbitf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__signbitf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   signbitl
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNBITL_0100
     * @tc.desc   libc-test __signbitl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("signbitl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__signbitl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   finitef
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0100
     * @tc.desc   libc-test finitef
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("finitef", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("finitef");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   nan
     * @tc.number SUB_THIRDPARTY_MUSL_NAN_0100
     * @tc.desc   libc-test nan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nan", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nan");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   nanf
     * @tc.number SUB_THIRDPARTY_MUSL_NANF_0100
     * @tc.desc   libc-test nanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   nanl
     * @tc.number SUB_THIRDPARTY_MUSL_NANL_0100
     * @tc.desc   libc-test nanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("nanl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("nanl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   rint_ext
     * @tc.number SUB_THIRDPARTY_MUSL_RINT_EXT_0100
     * @tc.desc   libc-test rint_ext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rint_ext", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rint_ext");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   significand
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNIFICAND_0100
     * @tc.desc   libc-test significand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("significand", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("significand");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   significandf
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNIFICANDF_0100
     * @tc.desc   libc-test significandf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("significandf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("significandf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   signbit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNBIT_0100
     * @tc.desc   libc-test __signbit
     */
    it("signbit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__signbit");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   finite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FINITE_0100
     * @tc.desc   libc-test finite
     */
    it("finite", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("finite");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   functionalext_pow10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FUNCTIONALEXT_POW_TEN_BASIC_0100
     * @tc.desc   libc-test functionalext_pow10
     */
    it("functionalext_pow10", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("functionalext_pow10");
      expect(result).assertEqual(0);
      done();
    });

  });
}
