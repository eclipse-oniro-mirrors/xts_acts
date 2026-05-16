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

export default function FunctionalextSupplementTempTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_temp", () => {
    /**
     * @tc.name   mktemp
     * @tc.number SUB_THIRDPARTY_MUSL_MKTEMP_0100
     * @tc.desc   libc-test mktemp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mktemp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mktemp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mkostemp
     * @tc.number SUB_THIRDPARTY_MUSL_MKOSTEMP_0100
     * @tc.desc   libc-test mkostemp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mkostemp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mkostemp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mkostemps
     * @tc.number SUB_THIRDPARTY_MUSL_MKOSTEMPS_0100
     * @tc.desc   libc-test mkostemps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mkostemps", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mkostemps");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mkstemp
     * @tc.number SUB_THIRDPARTY_MUSL_MKSTEMP_0100
     * @tc.desc   libc-test mkstemp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mkstemp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mkstemp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mkstemps
     * @tc.number SUB_THIRDPARTY_MUSL_MKSTEMPS_0100
     * @tc.desc   libc-test mkstemps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mkstemps", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mkstemps");
      expect(result).assertEqual(0);
      done();
    });
  });
}
