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

export default function exit_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_exit", () => {
    /**
     * @tc.name   at_quick_exit
     * @tc.number SUB_THIRDPARTY_MUSL_AT_QUICK_EXIT_0100
     * @tc.desc   libc-test at_quick_exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("at_quick_exit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("at_quick_exit");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atexit
     * @tc.number SUB_THIRDPARTY_MUSL_ATEXIT_0100
     * @tc.desc   libc-test atexit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atexit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atexit");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   quick_exit
     * @tc.number SUB_THIRDPARTY_MUSL_QUICK_EXIT_0100
     * @tc.desc   libc-test quick_exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("quick_exit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("quick_exit");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   a_cxa_atexit
     * @tc.number SUB_THIRDPARTY_MUSL_CXA_ATEXIT_0100
     * @tc.desc   libc-test a_cxa_atexit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("a_cxa_atexit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("a_cxa_atexit");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   double_exit
     * @tc.number SUB_THIRDPARTY_MUSL_DOUBLE_EXIT_0100
     * @tc.desc   libc-test double_exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("double_exit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("double_exit");
      expect(result).assertEqual(0);
      done();
    });
  });
}
