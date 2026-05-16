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

export default function FunctionalextSupplementSearchTestGroupTest() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_search", () => {
    /**
     * @tc.name   hcreate_r
     * @tc.number SUB_THIRDPARTY_MUSL_HCREATE_R_0100
     * @tc.desc   libc-test hcreate_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hcreate_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hcreate_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hdestroy
     * @tc.number SUB_THIRDPARTY_MUSL_HDESTROY_0100
     * @tc.desc   libc-test hdestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hdestroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hdestroy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hsearch_r
     * @tc.number SUB_THIRDPARTY_MUSL_HSEARCH_R_0100
     * @tc.desc   libc-test hsearch_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hsearch_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hsearch_r");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lfind
     * @tc.number SUB_THIRDPARTY_MUS_LFIND_0100
     * @tc.desc   libc-test lfind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lfind", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lfind");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tdestroy
     * @tc.number SUB_THIRDPARTY_MUS_TDESTROY_0100
     * @tc.desc   libc-test tdestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tdestroy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tdestroy");
      expect(result).assertEqual(0);
      done();
    });
  });
}
