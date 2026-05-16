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

export default function fortify_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_fortify", () => {
    /**
     * @tc.name   poll
     * @tc.number SUB_THIRDPARTY_MUSL_POLL_0100
     * @tc.desc   libc-test poll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("poll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("poll");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   invalid_param_b
     * @tc.number SUB_THIRDPARTY_MUSL_INVALID_PARAM_B_0100
     * @tc.desc   libc-test invalid_param_b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("invalid_param_b", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("invalid_param_b");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   invalid_param
     * @tc.number SUB_THIRDPARTY_MUSL_INVALID_PARAM_0100
     * @tc.desc   libc-test invalid_param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("invalid_param", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("invalid_param");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   select_test
     * @tc.number SUB_THIRDPARTY_MUSL_SELECT_TEST_0100
     * @tc.desc   libc-test select_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("select_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("select_test");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_fortify_test
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_FORTIFY_TEST_0100
     * @tc.desc   libc-test pthread_fortify_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_fortify_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_fortify_test");
      expect(result).assertEqual(0);
      done();
    });
  });
}
