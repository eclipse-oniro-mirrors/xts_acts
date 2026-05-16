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

export default function FunctionalextSigchainTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_sigchain", () => {
    /**
     * @tc.name   sigchain_intercept_pthread_sigmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SIGCHAIN_INTERCEPT_PTHREAD_SIGMASK_0100
     * @tc.desc   libc-test sigchain_intercept_pthread_sigmask
     */
    it("sigchain_intercept_pthread_sigmask", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigchain_intercept_pthread_sigmask");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sigchain_rm_special_handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SIGCHAIN_RM_SPECIAL_HANDLER_0100
     * @tc.desc   libc-test sigchain_rm_special_handler
     */
    it("sigchain_rm_special_handler", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigchain_rm_special_handler");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sigchain_set_pre_validation_ignore_thread_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SIGCHAIN_SET_PRE_VALIDATION_IGNORE_THREAD_TEST_0100
     * @tc.desc   libc-test sigchain_set_pre_validation_ignore_thread_test
     */
    it("sigchain_set_pre_validation_ignore_thread_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigchain_set_pre_validation_ignore_thread_test");
      expect(result).assertEqual(0);
      done();
    });
  });
}
