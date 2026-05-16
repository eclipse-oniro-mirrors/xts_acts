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

export default function FunctionalextSupplementManualNetworkTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_manual_network", () => {
    /**
     * @tc.name   gethostbyaddr
     * @tc.number SUB_THIRDPARTY_MUSL_GETHOSTBYADDR_0100
     * @tc.desc   libc-test gethostbyaddr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gethostbyaddr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gethostbyaddr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   gethostbyaddr_r
     * @tc.number SUB_THIRDPARTY_MUSL_GETHOSTBYADDR_R_0100
     * @tc.desc   libc-test gethostbyaddr_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gethostbyaddr_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gethostbyaddr_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   gethostbyname2_r
     * @tc.number SUB_THIRDPARTY_MUSL_GETHOSTBYNAME_TWO_R_0100
     * @tc.desc   libc-test gethostbyname2_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gethostbyname2_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gethostbyname2_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getnameinfo
     * @tc.number SUB_THIRDPARTY_MUSL_GETNAMEINFO_0100
     * @tc.desc   libc-test getnameinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getnameinfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getnameinfo");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   gethostbyname2
     * @tc.number SUB_THIRDPARTY_MUSL_GETHOSTBYNAME_TWO_0100
     * @tc.desc   libc-test gethostbyname2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gethostbyname2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gethostbyname2");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   gethostbyname_r
     * @tc.number SUB_THIRDPARTY_MUSL_GETHOSTBYNAME_R_0100
     * @tc.desc   libc-test gethostbyname_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gethostbyname_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gethostbyname_r");
      expect(result).assertEqual(0);
      done();
    });
  });
}
