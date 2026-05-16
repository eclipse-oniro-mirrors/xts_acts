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

export default function stat_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_stat", () => {
    /**
     * @tc.name   umask
     * @tc.number SUB_THIRDPARTY_MUSL_UMASK_0100
     * @tc.desc   libc-test umask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("umask", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("umask");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   chmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_CHMOD_0100
     * @tc.desc   libc-test chmod
     */
    it("chmod", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("chmod");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fchmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FCHMOD_0100
     * @tc.desc   libc-test fchmod
     */
    it("fchmod", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fchmod");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fchmodat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FCHMODAT_0100
     * @tc.desc   libc-test fchmodat
     */
    it("fchmodat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fchmodat");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   futimesat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FUTIMESAT_0100
     * @tc.desc   libc-test futimesat
     */
    it("futimesat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("futimesat");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   utimensat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_UTIMENSAT_0100
     * @tc.desc   libc-test utimensat
     */
    it("utimensat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("utimensat");
      expect(result).assertEqual(0);
      done();
    });

  });
}
