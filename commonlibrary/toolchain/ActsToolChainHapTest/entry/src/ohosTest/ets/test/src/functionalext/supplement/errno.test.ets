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

export default function errno_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_errno", () => {
    /**
     * @tc.name   strerror
     * @tc.number SUB_THIRDPARTY_MUSL_STRERROR_0100
     * @tc.desc   libc-test strerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strerror", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strerror");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   test_errno_location
     * @tc.number SUB_THIRDPARTY_MUSL_ERRNO_LOCATION_0100
     * @tc.desc   libc-test test_errno_location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_errno_location", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__errno_location");
      expect(result).assertEqual(0);
      done();
    });
  });
}
