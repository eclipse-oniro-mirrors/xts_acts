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

export default function stdlib_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_stdlib", () => {
    /**
     * @tc.name   abs
     * @tc.number SUB_THIRDPARTY_MUSL_ABS_0100
     * @tc.desc   libc-test abs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("abs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("abs");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atof
     * @tc.number SUB_THIRDPARTY_MUSL_ATOF_0100
     * @tc.desc   libc-test atof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atof");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atoi
     * @tc.number SUB_THIRDPARTY_MUSL_ATOI_0100
     * @tc.desc   libc-test atoi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atoi", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atoi");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atoll
     * @tc.number SUB_THIRDPARTY_MUSL_ATOLL_0100
     * @tc.desc   libc-test atoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atoll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atoll");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   bsearch
     * @tc.number SUB_THIRDPARTY_MUSL_BSEARCH_0100
     * @tc.desc   libc-test bsearch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("bsearch", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("bsearch");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   imaxabs
     * @tc.number SUB_THIRDPARTY_MUSL_IMAXABS_0100
     * @tc.desc   libc-test imaxabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("imaxabs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("imaxabs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   imaxdiv
     * @tc.number SUB_THIRDPARTY_MUSL_IMAXDIV_0100
     * @tc.desc   libc-test imaxdiv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("imaxdiv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("imaxdiv");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   labs
     * @tc.number SUB_THIRDPARTY_MUSL_LABS_0100
     * @tc.desc   libc-test labs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("labs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("labs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ldiv
     * @tc.number SUB_THIRDPARTY_MUSL_LDIV_0100
     * @tc.desc   libc-test ldiv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ldiv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ldiv");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   llabs
     * @tc.number SUB_THIRDPARTY_MUSL_LLABS_0100
     * @tc.desc   libc-test llabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("llabs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("llabs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   lldiv
     * @tc.number SUB_THIRDPARTY_MUSL_LLDIV_0100
     * @tc.desc   libc-test lldiv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lldiv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lldiv");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strtoimax
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOIMAX_0100
     * @tc.desc   libc-test strtoimax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtoimax", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtoimax");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strtoumax
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOUMAX_0100
     * @tc.desc   libc-test strtoumax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtoumax", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtoumax");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstod
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOD_0100
     * @tc.desc   libc-test wcstod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstod", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstod");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstof
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_0100
     * @tc.desc   libc-test wcstof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstof");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstold
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_0100
     * @tc.desc   libc-test wcstold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstold", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstold");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstoimax
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOIMAX_0100
     * @tc.desc   libc-test wcstoimax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstoimax", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstoimax");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstoumax
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOUMAX_0100
     * @tc.desc   libc-test wcstoumax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstoumax", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstoumax");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   functionalext_fcvt
     * @tc.number SUB_THIRDPARTY_MUSL_FUNCTIONALEXT_FCVT_0100
     * @tc.desc   libc-test functionalext_fcvt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("functionalext_fcvt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("functionalext_fcvt");
      expect(result).assertEqual(0);
      done();
    });
  });
}
