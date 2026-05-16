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

export default function FunctionalextSupplementWctypeTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_wctype", () => {
    /**
     * @tc.name   iswctype_l
     * @tc.number SUB_THIRDPARTY_MUSL_ISWCTYPE_L_0100
     * @tc.desc   libc-test iswctype_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswctype_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswctype_l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswgraph
     * @tc.number SUB_THIRDPARTY_MUSL_ISWGRAPH_0100
     * @tc.desc   libc-test iswgraph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswgraph", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswgraph");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iswalnum_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_ISWALNUM_L_0100
     * @tc.desc   libc-test iswalnum_l
     */
    it("iswalnum_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswalnum_l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   iswgraph_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_ISWGRAPH_L_0100
     * @tc.desc   libc-test iswgraph_l
     */
    it("iswgraph_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswgraph_l");
      expect(result).assertEqual(0);
      done();
    });

  });
}
