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

export default function prng_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_prng", () => {
    /**
     * @tc.name   drand48
     * @tc.number SUB_THIRDPARTY_MUSL_DRAND_FOUR_EIGHT_0100
     * @tc.desc   libc-test drand48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("drand48", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("drand48");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erand48
     * @tc.number SUB_THIRDPARTY_MUSL_ERAND_FOUR_EIGHT_0100
     * @tc.desc   libc-test erand48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erand48", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erand48");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   lcong48
     * @tc.number SUB_THIRDPARTY_MUSL_LCONG_FOUR_EIGHT_0100
     * @tc.desc   libc-test lcong48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lcong48", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lcong48");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   lrand48
     * @tc.number SUB_THIRDPARTY_MUSL_LRAND_FOUR_EIGHT_0100
     * @tc.desc   libc-test lrand48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lrand48", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lrand48");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mrand48
     * @tc.number SUB_THIRDPARTY_MUSL_MRAND_FOUR_EIGHT_0100
     * @tc.desc   libc-test mrand48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mrand48", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mrand48");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   rand
     * @tc.number SUB_THIRDPARTY_MUSL_RAND_0100
     * @tc.desc   libc-test rand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rand", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rand");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   rand_r
     * @tc.number SUB_THIRDPARTY_MUSL_RAND_R_0100
     * @tc.desc   libc-test rand_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rand_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rand_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   seed48
     * @tc.number SUB_THIRDPARTY_MUSL_SEED_FOUR_EIGHT_0100
     * @tc.desc   libc-test seed48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("seed48", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("seed48");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   srand
     * @tc.number SUB_THIRDPARTY_MUSL_SRAND_0100
     * @tc.desc   libc-test srand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("srand", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("srand");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   srand48
     * @tc.number SUB_THIRDPARTY_MUSL_SRAND_FOUR_EIGHT_0100
     * @tc.desc   libc-test srand48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("srand48", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("srand48");
      expect(result).assertEqual(0);
      done();
    });
  });
}
