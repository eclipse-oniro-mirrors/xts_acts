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

export default function fenv_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_fenv", () => {
    /**
     * @tc.name   flt_rounds
     * @tc.number SUB_THIRDPARTY_MUSL_FLT_ROUNDS_0100
     * @tc.desc   libc-test __flt_rounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("flt_rounds", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__flt_rounds");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   feholdexcept
     * @tc.number SUB_THIRDPARTY_MUSL_FEHOLDEXCEPT_0100
     * @tc.desc   libc-test feholdexcept
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("feholdexcept", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("feholdexcept");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   feupdateenv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FEUPDATEENV_0100
     * @tc.desc   libc-test feupdateenv
     */
    it("feupdateenv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("feupdateenv");
      expect(result).assertEqual(0);
      done();
    });

  });
}
