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

export default function FunctionalextLdsoDebugTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_ldso_debug", () => {
    /**
     * @tc.name   ldso_debug_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_LDSO_DEBUG_TEST_0100
     * @tc.desc   libc-test ldso_debug_test
     */
    it("ldso_debug_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ldso_debug_test");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ldso_memleak_check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_LDSO_MEMLEAK_CHECK_0100
     * @tc.desc   libc-test ldso_memleak_check
     */
    it("ldso_memleak_check", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ldso_memleak_check");
      expect(result).assertEqual(0);
      done();
    });
  });
}
